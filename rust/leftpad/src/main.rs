extern crate iron;
extern crate rustc_serialize;
use rustc_serialize::json;

use iron::prelude::*;
use iron::status;


#[derive(RustcEncodable)]
pub struct PadJson {
    str: String
}

fn main() {
    fn handler(_: &mut Request) -> IronResult<Response> {
        let padded_resp = PadJson {
            str: "Hallo".to_string(),
        };

        Ok(Response::with((status::Ok, json::encode(&padded_resp).unwrap())))
    }

    Iron::new(handler).http("localhost:3000").unwrap();
}
