from mitmproxy import http
from mitmproxy import ctx
local = "http://localhost:8080"
def request(f: http.HTTPFlow) -> None:
  d1 = f.request.data
  h1 = f.request.headers
  real = "https://" + d1.host
  h1["Origin"] = real
  h1["Referer"] = real
def response(f: http.HTTPFlow) -> None:
  h2 = f.response.headers
  h2["Access-Control-Allow-Origin"] = local
def websocket_start(f: http.HTTPFlow):
  d1 = f.request.data
  h1 = f.request.headers
  h2 = f.response.headers
  real = "https://" + d1.host
  h1["Origin"] = real
  h1["Referer"] = real
  h2["Access-Control-Allow-Origin"] = local
