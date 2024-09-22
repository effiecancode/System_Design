import asyncio
import aiohttp

async def fetch_page(url):
    async with aiohttp.ClientSession() as session:
        async with session.get(url) as response:
            html = await response.text()
            return html

async def main():
    urls = [
        'http://github.com/effiecancode',
        'https://x.com/effiecancode'
    ]

    tasks = [fetch_page(url) for url in urls]
    pages = await asyncio.gather(*tasks)

    for url, content in zip(urls, pages):
        print(f'URL: {url}')
        print(f'Content length: {len(content)}') # or alternatively print(content) in html
        print('---')

asyncio.run(main())