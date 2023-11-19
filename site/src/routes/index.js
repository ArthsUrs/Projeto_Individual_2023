var express = require("express");
var router = express.Router();

router.get("/", function (req, res) {
    res.render("/siteHome/indexHome.html");
});

module.exports = router;