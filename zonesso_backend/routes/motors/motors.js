const express = require('express');
const {getMotors, getMotorDeatils } = require('../../controllers/motors/motors');
const router = express.Router();

router.get('/motors', getMotors);
router.get('/motors/:id', getMotorDeatils);

module.exports = router;