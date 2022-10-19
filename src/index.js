const express = require('express');
const app = express();
app.get('/', (req, res, next) => {
    res.send('Hello World!');
    res.end();
});
app.listen(9420, () => {
    console.log('Server started at port 9420...');
});