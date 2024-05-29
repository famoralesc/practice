import asyncio
import aiohttp

RESOURCE_TODOS_URL = "https://jsonplaceholder.typicode.com/users/{0}/todos"
RESOURCE_USERS_URL = 'https://jsonplaceholder.typicode.com/users'
RESOURCE_POSTS_URL = "https://jsonplaceholder.typicode.com/users/{0}/posts"
USER_ID = 1

async def getPosts(user_id: int) -> any:
    api_url = RESOURCE_POSTS_URL.format(user_id)
    print(f"Fetching data from {api_url}")
    async with aiohttp.ClientSession() as session:
        async with session.get(api_url) as response:
            return await response.json()

async def getTODOS(user_id: int) -> any:
    api_url = RESOURCE_TODOS_URL.format(user_id)
    print(f"Fetching data from {api_url}")
    async with aiohttp.ClientSession() as session:
        async with session.get(api_url) as response:
            return await response.json()

async def getUsers() -> any:
    api_url = RESOURCE_USERS_URL
    print(f"Fetching data from {api_url}")
    async with aiohttp.ClientSession() as session:
        async with session.get(api_url) as response:
            return await response.json()

async def fetch_user_comments_posts():
    users, todos, posts = await asyncio.gather(getUsers(), getTODOS(USER_ID), getPosts(USER_ID))
    user = [user for user in users if user["id"] == USER_ID][-1]
    return {
        "user": user,
        "posts": posts,
        "todos": todos,
    }

if __name__ == "__main__":
    import time
    s = time.perf_counter()
    response = asyncio.run(fetch_user_comments_posts())
    elapsed = time.perf_counter() - s
    print(f"{__file__} executed in {elapsed:0.2f} seconds.")