extern crate iron;
extern crate rustc_serialize;
extern crate queryst;

use rustc_serialize::json::{self, Json};
use iron::prelude::*;
use iron::status;
use queryst::parse;

#[derive(RustcEncodable)]
pub struct PadJson {
    str: String
}

fn main() {
    fn handler(req: &mut Request) -> IronResult<Response> {
        let padded_resp = PadJson {
            str: "Hallo".to_string(),
        };

        let query = req.url.query.clone().unwrap_or("".to_string());

        let query_params: Json = parse(&query.to_string()).unwrap();

        Ok(Response::with((status::Ok, json::encode(&padded_resp).unwrap())))
    }

    Iron::new(handler).http("localhost:3000").unwrap();
}
