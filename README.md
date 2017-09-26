# URI
Unique Researcher Identity

## Problem
fragmented solution to the problem of unique researcher identity (URI) proposed by multiple centralized organizations
1. Researcher ID http://www.researcherid.com/
2. ORCID https://orcid.org/
3. Google Scholar https://scholar.google.com/
4. Researchgate https://www.researchgate.net/

## Solution
- create a unique researcher identity (URI) based on blockchain technology
- the URI will be connected to the researcher's profile,  research activities, and publications
- connect URI with IPIS to implement the "cost of idea" https://github.com/open-science-org/wiki/wiki/OSO-Whitepaper#cost-of-idea

## Approach
1. Encapsulate the researcher ID inside the Idea class of Interplanetary Idea System (IPIS) https://github.com/open-science-org/IPIS
- not feasible at its current state

2. Use third party service such as CIVIC and LINK
- CIVIC can be used as an authenticator
- LINK can be used to pull data from existing researcher identity platforms such ORCID, Google Scholar, etc.

3. Hybrid approach 
- combining the concept of IPIS and authenticator and oracle services from third party

## References
1. http://www.jakobrdl.dk/blog/2015/02/why-orcid-and-researcherid-when-we-have-google-scholar
