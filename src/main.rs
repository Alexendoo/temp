use axum::{
    Json, Router,
    http::StatusCode,
    routing::{get, post},
};
use serde_json::Value;

#[tokio::main]
async fn main() {
    // build our application with a route
    let app = Router::new().route("/webhook", post(create_user));

    // run our app with hyper, listening globally on port 3000
    let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await.unwrap();
    axum::serve(listener, app).await.unwrap();
}

async fn create_user(
    // this argument tells axum to parse the request body
    // as JSON into a `CreateUser` type
    Json(payload): Json<Value>,
) {
    dbg!(payload);
}
