import sys
from vibora import Vibora, Response, Websocket, JsonResponse

app = Vibora()

# Hello World
@app.route('/')
async def home():
    return Response(b'Hello world')

# Json response
@app.route('/json')
async def helloworld():
    return JsonResponse({'hello': 'world'})

# Async websocket connection
@app.websocket('/socket')
async def on_connect(ws: Websocket):
    # Reply back the received message.
    while True:
        await ws.write(await ws.read())

if __name__ == '__main__':
    try:
        port = int(sys.argv[1])
    except Exception as e:
        port = 5000
    app.run(debug=True, host='0.0.0.0', port=port)