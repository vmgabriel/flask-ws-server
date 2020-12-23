"""
App Flask Control
"""

# Libraries
import asyncio
import websockets


# Environent
from config import configurations as configs


async def echo_ws(websocket, path):
    """Echo Websocket server"""
    print(f'path {path}')
    async for message in websocket:
        print(f'[Client] - # {message}')
        await websocket.send(message)


if __name__ == '__main__':
    host = configs['server']['host']
    port = configs['server']['port']
    start_server = websockets.serve(echo_ws, host, port)

    print(f'Server load into ws://{host}:{port}')
    asyncio.get_event_loop().run_until_complete(start_server)
    asyncio.get_event_loop().run_forever()
