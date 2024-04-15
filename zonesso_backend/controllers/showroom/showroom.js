const {showroomDetails} = require('./showroomResponse');
const db = require('../../models/vehicles');

exports.getShowrooms = db.getShowrooms;