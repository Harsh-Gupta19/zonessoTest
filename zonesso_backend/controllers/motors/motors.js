// const {getMotors} = require('./motorsResponse');
// const {getMotorDetail} = require('./motorDetailResponse');
const db = require('../../models/vehicles');

exports.getMotors = db.getVehicles;

exports.getMotorDeatils = db.getVehiclesById;


