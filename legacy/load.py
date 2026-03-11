 
import requests

query = """
SPARQL LOAD <file:///rdf/test.ttl>
INTO GRAPH <http://example.org/>
"""

res = requests.post(
    "http://localhost:8890/sparql",
    auth=("dba","dba"),
    data={"update": query}
)

print(res.status_code)
print(res.text)
