var express 	        = require('express'),
	misc 		        = require('./routes/misc'),
	users 		        = require('./routes/users'),
	searchUsers	        = require('./routes/searchUsers'),
    categories          = require('./routes/categories'),
    locations	        = require('./routes/locations'),
    pictures            = require('./routes/pictures'),
    searchUserByEmail 	= require('./routes/searchUserByEmail'),
    bands               = require('./routes/bands'),
    zipcodes            = require('./routes/zipcodes'),
   	dummy 		        = require('./routes/dummy');
   	//misc = require('./routes/misc');

var app = express();



app.set('port', process.env.PORT || 8888);
app.use(express.logger('dev'));
app.use(express.bodyParser());
app.use(express.methodOverride());
app.use(app.router);

app.configure('development', function () {
    app.use(express.errorHandler());
    app.use(function(req, res, next) {
        res.header("Access-Control-Allow-Origin", "*");
        res.header("Access-Control-Allow-Headers", "X-Requested-With");
        next();
    });
});

app.get('/ping',misc.ping);
app.get('/users/:userId', users.get);
app.post('/users/', users.post);
app.post('/users/search/:admin', searchUsers.post);

app.get('/categories/:categoryId',categories.get);

app.get('/locations/:locationId', locations.get);
app.get('/locations/zipcodes/:zipcodeId', zipcodes.get);
app.options('/locations/zipcodes/:zipcodeId', zipcodes.options);
app.get('/users/searchByEmail/:email', searchUserByEmail.get);

app.post('/pictures', pictures.post);
app.options('/pictures', pictures.options);

app.get('/bands/:bandId', bands.get);
app.post('/bands/',bands.post);


//app.get('/catalog',catalog.get);
//app.put('/catalog/:cataloId?',catalog.active)


app.get('/dummy',dummy.getDummyInfo);


//
// 404 
//
app.all('*', misc.notFound);


app.listen(app.get('port'), function(){
	console.log("Mock maxibandas server listening on port " + app.get('port'));
});

