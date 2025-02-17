class MongoInst:
    def __init__(self):
        self.url = 'mongodb+srv://yashu:yashu@cluster0.3jtnp.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0'
        pass

    def getUrl(self):
        return self.url