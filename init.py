#Import Flask Library
from flask import Flask, render_template, request, session, url_for, redirect
import pymysql.cursors, md5
import datetime

#Initialize the app from Flask
app = Flask(__name__)

#Configure MySQL
conn = pymysql.connect(host='localhost',
                       user='root',
                       password='root',
                       db='FindFolks2',
                       charset='utf8mb4',
                       cursorclass=pymysql.cursors.DictCursor)

#Define a route to hello function
@app.route('/')
def hello():
        cursor = conn.cursor();
        query2 = 'SELECT * FROM an_event WHERE start_time >= Now() + 3'
        cursor.execute(query2)  
        events = cursor.fetchall()
        cursor.close()
        return render_template('index.html', events = events)

#Define route for login
@app.route('/login')
def login():
        return render_template('login.html')

#Define route for register
@app.route('/register')
def register():
        return render_template('register.html')

#Authenticates the login
@app.route('/loginAuth', methods=['GET', 'POST'])
def loginAuth():
        salt='27sR'
        #grabs information from the forms
        username = request.form['username']
        unhashpassword = request.form['password']
        password=md5.new(salt+unhashpassword).hexdigest()
        #cursor used to send queries
        cursor = conn.cursor()
        #executes query
        query = 'SELECT * FROM member WHERE username = %s and password = %s'
        cursor.execute(query, (username, password))
        #stores the results in a variable
        data = cursor.fetchone()
        #use fetchall() if you are expecting more than 1 data row
        cursor.close()
        error = None
        if(data):
                #creates a session for the the user
                #session is a built in
                session['username'] = username
                return redirect(url_for('home'))
        else:
                #returns an error message to the html page
                error = 'Invalid login or username'
                return render_template('login.html', error=error)

#Authenticates the register
@app.route('/registerAuth', methods=['GET', 'POST'])
def registerAuth():
        salt='27sR'
        #grabs information from the forms
        username = request.form['username']
        unhashedPassword = request.form['password']
        fname = request.form['fname']
        lname = request.form['lname']
        email = request.form['email']
        zipcode = request.form['zipcode']

        password=md5.new(salt+unhashedPassword).hexdigest()

        #cursor used to send queries
        cursor = conn.cursor()
        #executes query
        query = 'SELECT * FROM member WHERE username = %s'
        cursor.execute(query, (username))
        #stores the results in a variable
        data = cursor.fetchone()
        #use fetchall() if you are expecting more than 1 data row
        error = None
        if(data):
                #If the previous query returns data, then user exists
                error = "This user already exists"
                return render_template('register.html', error = error)
        else:
                ins = 'INSERT INTO member VALUES(%s, %s,%s,%s,%s,%s)'
                cursor.execute(ins, (username, password, fname, lname, email, zipcode))
                conn.commit()
                cursor.close()
                return render_template('index.html')

@app.route('/home')
def home():
        username = session['username']
        cursor = conn.cursor();
        query1 = 'SELECT ts, blog_post FROM blog WHERE username = %s ORDER BY ts DESC'
        cursor.execute(query1, (username))
        data = cursor.fetchall()
        
        query2 = 'SELECT * FROM an_event WHERE start_time >= Now() + 3'
        cursor.execute(query2)  
        events = cursor.fetchall()

        query3 = "SELECT event_id, title, start_time FROM sign_up NATURAL JOIN an_event WHERE username = %s"
        cursor.execute(query3, (username))
        data1 = cursor.fetchall()

        query4 = "Select username, event_id, title From sign_up Natural Join an_event where (username) IN (Select username From friend where friend_of = %s)" 
        cursor.execute(query4,(username))
        data2 = cursor.fetchall()
        
        cursor.close()
        return render_template('home.html', username=username, posts = data, events = events, viewEvents = data1, friends_events=data2)

@app.route('/signup', methods=['GET', 'POST'])
def signUpEvent():
        username = session['username']
        cursor = conn.cursor();
        event_id = request.form['event_id']
        update = "INSERT INTO sign_up (event_id, username) VALUES (%s, %s)"
        cursor.execute(update, (event_id, username))
        conn.commit()
        cursor.close()
        return redirect(url_for('home'))

@app.route('/post', methods=['GET', 'POST'])
def post():
        username = session['username']
        cursor = conn.cursor();
        blog = request.form['blog']
        query = 'INSERT INTO blog (blog_post, username) VALUES(%s, %s)'
        cursor.execute(query, (blog, username))
        conn.commit()
        cursor.close()
        return redirect(url_for('home'))
#Shefali
#Create an event
@app.route('/event', methods=['GET', 'POST'])
def checkAuth():
        username = session['username']
        cursor = conn.cursor();
        query = "SELECT group_id, group_name FROM belongs_to NATURAL JOIN a_group WHERE username = %s AND authorized = 1"
        cursor.execute(query, (username))
        chooseEvents = cursor.fetchall()
        cursor.close()
        return render_template('event.html', username=username, chooseEvents = chooseEvents)
	

@app.route('/createEvent', methods=['GET', 'POST'])
def eventForm():
        group_id = request.form['group']
        session['group'] = group_id
        return render_template('eventForm.html')

@app.route('/createEventForm', methods=['GET', 'POST'])
def createEvent():
        username = session['username']
        group_id = session['group']
        title = request.form['title']
        description = request.form['description']
        start_time = request.form['start_time']
        end_time = request.form['end_time']
        location_name = request.form['location_name']
        zipcode = request.form['zipcode']

        cursor = conn.cursor()
        event = "INSERT INTO an_event (title, description, start_time, end_time, location_name, zipcode) VALUES (%s, %s, %s, %s, %s, %s)"
        cursor.execute(event, (title, description, start_time, end_time, location_name, zipcode))
        prev_id = cursor.lastrowid

        addOrganize = "INSERT INTO organize (event_id, group_id) VALUES (%s, %s)"
        cursor.execute(addOrganize, (prev_id, group_id))

        addSignUp = "INSERT INTO sign_up(event_id, username) VALUES (%s, %s)"
        cursor.execute(addSignUp, (prev_id, username))
        conn.commit()
        cursor.close()
        return redirect(url_for('home'))

        
#Rate an event
#me
@app.route('/rating', methods=['GET', 'POST'])
def rateEvent():
        username = session['username']
        cursor = conn.cursor();
        query = "select event_id, title from sign_up natural join an_event where username= %s and end_time <= NOW()"
        cursor.execute(query, (username))
        rateEvents = cursor.fetchall()
        cursor.close()
        return render_template('rating.html', username=username, rateEvents = rateEvents)


@app.route('/rateEvent', methods=['GET', 'POST'])
def rateForm():
        event_id = request.form['event']
        session['event'] = event_id
        return render_template('rateForm.html')


@app.route('/rateEventForm', methods=['GET', 'POST'])
def rateEventForm():
        username = session['username']
        event_id = session['event']
        rating = request.form['rating']

        cursor = conn.cursor()
        event = "UPDATE sign_up SET rating = %s WHERE username = %s AND event_id = %s"
        cursor.execute(event, (rating, username, event_id))
        
        conn.commit()
        cursor.close()
        return redirect(url_for('home'))

#Rate a location
@app.route('/location', methods=['GET', 'POST'])
def rateLocation():
        cursor = conn.cursor();
        query = "select location_name, zipcode, address from location"
        cursor.execute(query)
        locations = cursor.fetchall()
        cursor.close()
        return render_template('location.html', locations = locations)

@app.route('/rateLocation', methods=['GET', 'POST'])
def chooseLocation():
        location_name = request.form['location']
        session['location'] = location_name
        return render_template('locationForm.html')


@app.route('/locationEventForm', methods=['GET', 'POST'])
def rateLocationForm():
        location_name = session['location']
        rating = request.form['rating']

        cursor = conn.cursor()
        event = "UPDATE location SET rating = %s WHERE location_name = %s"
        cursor.execute(event, (rating, location_name))
        
        conn.commit()
        cursor.close()
        return redirect(url_for('home'))

#Preference for an Interest
@app.route('/Interest', methods=['GET', 'POST'])
def rateInterest():
        cursor = conn.cursor();
        query = "select category, keyword from interest"
        cursor.execute(query)
        interests = cursor.fetchall()
        cursor.close()
        return render_template('interest.html', interests = interests)

@app.route('/rateInterest', methods=['GET', 'POST'])
def chooseInterest():
        category = request.form['category']
        session['category'] = category
        return render_template('interestForm.html')


@app.route('/InterestForm', methods=['GET', 'POST'])
def rateInterestForm():
        category = session['category']
        rating = request.form['rating']

        cursor = conn.cursor()
        event = "UPDATE interest SET rating = %s WHERE category = %s"
        cursor.execute(event, (rating, category))
        
        conn.commit()
        cursor.close()
        return redirect(url_for('home'))

#Create a Group

@app.route('/group', methods=['GET', 'POST'])
def groupForm():
        return render_template('groupForm.html')

@app.route('/createGroupForm', methods=['GET', 'POST'])
def addGroup():
        username = session['username']
        title = request.form['title']
        description = request.form['description']

        cursor = conn.cursor()
        group = "INSERT INTO a_group (group_name, description, creator) VALUES (%s, %s, %s)"
        cursor.execute(group, (title, description, username))
        prev_id = cursor.lastrowid

        conn.commit()
        cursor.close()
        return redirect(url_for('home'))


#Average Rating for a location
@app.route('/avgLocation', methods=['GET', 'POST'])
def avgLocationRatings():
        cursor = conn.cursor();
        query = 'SELECT AVG(rating) AS avgRatingLoc, location_name, zipcode, address FROM location GROUP BY location_name, zipcode, address'
        cursor.execute(query);
        data = cursor.fetchall()

        cursor.close()
        return render_template('/avgRatingsLocation.html', avgRatingsLoc=data)

#Average rating for an Event
@app.route('/avgEvent', methods=['GET', 'POST'])
def avgEventRatings():
        cursor = conn.cursor();
        query = 'SELECT AVG(rating) AS avgRatingEvent, title, event_id FROM an_event NATURAL JOIN sign_up WHERE start_time < NOW() GROUP BY title, event_id'
        cursor.execute(query);
        data = cursor.fetchall()
        cursor.close()
        return render_template('/avgRatingsEvent.html', avgRatingsEvent=data)


#suggests Groups
@app.route('/suggestedgroups', methods=['GET', 'POST'])
def suggest_group():
        username = session['username']
        cursor = conn.cursor();
        query= 'Select group_id, group_name , description, keyword from a_group Natural Join about where (keyword) In (Select keyword from interested_in where username = %s) ;'
        cursor.execute(query, username)
        data = cursor.fetchall();
        conn.commit()
        cursor.close()
        return render_template('groupsuggest.html', event=data)

@app.route('/event_search', methods=['GET', 'POST'])
def event_search():
        username = session['username']
        cursor = conn.cursor();
        query= 'Select event_id, title , start_time, keyword from an_event Natural Join tags where (keyword) In (Select keyword from interested_in where username = %s) ;'
        cursor.execute(query, username)
        data = cursor.fetchall();
        conn.commit()
        cursor.close()
        return render_template('event_search.html', an_event=data)


@app.route('/interests')
def interests():
        username = session['username']
        cursor = conn.cursor();
        query1 = 'SELECT category, keyword FROM interested_in WHERE username = %s order by category'
        cursor.execute(query1, (username))
        data=cursor.fetchall()
        conn.commit
        cursor.close()
        return render_template('interests.html', interested_in =data )

@app.route('/addinterests', methods=['GET', 'POST'])
def addInterest():
        username = session['username']
        category = request.form['category']
        keyword = request.form['keyword']
        cursor = conn.cursor();
        query2= 'Insert INTO interest (category, keyword) values(%s, %s)'
        query3= 'Insert INTO interested_in (username, category, keyword) values(%s, %s, %s)'
        cursor.execute(query2,(category, keyword))
        cursor.execute(query3,(username, category, keyword))
        conn.commit()
        cursor.close()
        return redirect(url_for('interests'))


#Select an Interest and see groups that share the interest

@app.route('/selectInterest', methods=['GET', 'POST'])
def selectInterest():
    cursor = conn.cursor();
    query = "select category, keyword from interest"
    cursor.execute(query)

    selectInterests = cursor.fetchall()

    cursor.close()

    return render_template('selectInterest.html', selectInterests = selectInterests)



@app.route('/chooseInterests', methods=['GET', 'POST'])

def viewSelectedInterests():
    interests = request.form['interests']
    session['interests'] = interests
    cursor = conn.cursor()
    query = "Select group_id, group_name, description from a_group Natural Join about where category = %s"

    cursor.execute(query, (interests))

    viewGroups = cursor.fetchall();
    cursor.close()
    return render_template('viewGroups.html', viewGroups = viewGroups)

#Add tags
@app.route('/goingto', methods=['GET', 'POST'])
def checkAuthevent():
        username = session['username']
        cursor = conn.cursor();
        query = "SELECT event_id, title FROM an_event Natural JOIN organize NATURAL JOIN belongs_to WHERE username = %s AND authorized = 1"
        cursor.execute(query, (username))
        chooseEvents = cursor.fetchall()
        cursor.close()
        return render_template('tageventsform.html', username=username, chooseEvents = chooseEvents)

@app.route('/addtagsform', methods=['GET', 'POST'])
def addtagsform():
        event_id = request.form['event_id']
        session['event_id'] = event_id
        return render_template('addtags.html')

@app.route('/addtags', methods=['GET', 'POST'])
def addtags():
        username = session['username']
        event_id = session['event_id']
        tags = request.form['keyword']
        cursor=conn.cursor()
        event = "INSERT INTO tags (keyword, event_id) values (%s, %s)"
        cursor.execute(event, (tags, event_id))
        query="Select keyword FROM tags where event_id = %s"
        cursor.execute(query, event_id)
        data =cursor.fetchall()
        conn.commit()
        cursor.close()
        return render_template('addtags.html', tags=data )

#logout
@app.route('/logout')
def logout():
        session.pop('username')
        return redirect('/')
                
app.secret_key = 'some key that you will never guess'
#Run the app on localhost port 5000
#debug = True -> you don't have to restart flask
#for changes to go through, TURN OFF FOR PRODUCTION
if __name__ == "__main__":
        app.run('127.0.0.1', 5000, debug = True)
