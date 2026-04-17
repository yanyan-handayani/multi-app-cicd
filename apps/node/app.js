const express = require("express");
const app = express();

app.get("/", (req, res) => {
    res.send("Hello from MULTI DEPLOY 🚀");
});

app.listen(3000, "0.0.0.0", () => {
    console.log("Node running on port 3000");
});