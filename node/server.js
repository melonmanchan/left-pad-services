import express from 'express';
import ip      from 'ip';

import leftpad from './left-pad';

const app  = express();
const port = process.env.PORT || 3000;

app.get('/', (req, res) => {
    const str = req.query.str;
    const ch  = req.query.ch;
    const len = req.query.len;

    res.status(200).json({ str: leftpad(str, len, ch) });
});

if (!module.parent) {
    app.listen(port, () => {
        console.log(`Express app running at ${ip.address()}:${port}`);
    });
}

export default app;
