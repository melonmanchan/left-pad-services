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

fn left_pad(string: &str, len: u32, ch: &str) -> String {

    let mut i: i32 = -1;
    let temp_len: i32 = len as i32 - (string.len() as i32);
    let mut return_string : String = string.to_string();

    while i < temp_len {
        return_string = ch.to_string() + &string.to_string();
        i = i + 1;
    }

    return String::from(return_string);
}

fn main() {
    fn handler(req: &mut Request) -> IronResult<Response> {

        let query = req.url.query.clone().unwrap_or("".to_string());

        let query_params: Json = parse(&query.to_string()).unwrap();
        let obj                = query_params.as_object().unwrap();

        let string : &str = obj.get("str").unwrap().as_string().unwrap();
        let len : u32     = obj.get("len").unwrap().as_string().unwrap().parse().unwrap();
        let ch : &str     = obj.get("ch").unwrap().as_string().unwrap();

        let padded_resp = PadJson {
            str: left_pad(string, len, ch),
        };

        Ok(Response::with((status::Ok, json::encode(&padded_resp).unwrap())))
    }

    Iron::new(handler).http("localhost:3000").unwrap();
}
