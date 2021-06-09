# importing the module
from typing import NamedTuple

# creating a class
class Website(NamedTuple):
    name: str
    url: str
    rating: int

    def __getitem__(self, key):
        return object.__getitem__(key)
        # return super(Website, self).__getitem__(key)


# creating a NamedTuple
website1 = Website("GeeksforGeeks", "geeksforgeeks.org", 5)

# displaying the NamedTuple
print(website1)
