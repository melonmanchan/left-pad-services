import request from 'supertest';
import test    from 'tape';

import app     from '../server';

test('Should leftpad correctly', t => {
    request(app)
        .get('?str=paddin%27%20oswalt&len=68&ch=@')
        .expect(200)
        .expect('Content-Type', /json/)
        .end((err, res) => {
            if (err) throw err;
            t.equal(res.body.str, `@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@paddin' oswalt`)
            t.end();
        });
});
