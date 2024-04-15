const express = require('express');
const {getShowrooms} = require('../../controllers/showroom/showroom');
const router = express.Router();

router.get('/showrooms', getShowrooms);

module.exports = router;