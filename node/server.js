import express from 'express';
import ip      from 'ip';

const app  = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.send('alrigth');
});

app.listen(port, () => {
    console.log(`Express app running at ${ip.address()}:${port}`);
});
