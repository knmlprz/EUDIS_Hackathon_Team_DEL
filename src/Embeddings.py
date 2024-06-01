import requests


def text2vec(text):
    data = {"input": text}

    url = "http://localhost:8888/v1/embeddings"

    response = requests.post(url, json=data)
    print(response)
    if response.status_code == 200:
        print(response.text)
        response_data = response.json()
        embeddings_data = response_data['data']

        return embeddings_data[0]["embedding"]
