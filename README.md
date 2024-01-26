<div align="center">

<h2></h2>

# SSV - Simplified Streamable Values

[![Vlang][VlangBadge]][VlangLink]
![WIP][WIPBadge]

</div>

## The problem

The format comma-separated values (CSV) has a series of inconsistencies as pointed out by [Stenway](https://github.com/Stenway). With this in mind, there is a need to create a new form to (de)serialize data to improve speed / readability / simplicity.

1. **Speed** &ndash; the complexity and ambiguity of CSV makes it so parsers become slower and less efficient at processing data. For a well-built, robust system, speed is a major parameter. To increase speed of (de)serialization, 2 things can be done:

    - *Create a simpler standard* &ndash; a well defined, unambiguous, compact standard leads to less computations required, improving speed of encoding/decoding;

    - *Reduce readability* &ndash; by basing the standard on difficult to read yet compact formats, memory usage and time reading data can be reduced.

2. **Readability** &ndash; when a system serves as an interface with the human operator, it is crucial that it is easily and swiftly interpreted by them. To this effect, several requirements rise up:

    - *Cultural context* &ndash; the file must support most languages and characters;

    - *Valid text* &ndash; all characters used must be available to the user's input device;

    - *Concise information* &ndash; extra, unneeded characters should be avoided to allow the operator to focus on the important information in the file;

    - *Context aware format* &ndash; information should be presented in a format such that the operator can understand the context in which the information is relevant.

No perfect solution exists which marries speed and readability in all aspects. However, a system can be developed which can (de)serialize data in both forms: for machines and for humans.

## Proposed solution

- typed values &ndash; type information should be present (text, number, binary, null)

- collections &ndash; include lists and dictionaries

[VlangBadge]: https://img.shields.io/badge/Vlang-%235D87BF?style=for-the-badge&logo=v&logoColor=white
[VlangLink]: https://vlang.io
[WIPBadge]: https://img.shields.io/badge/Work%20In%20Progress-orange?style=for-the-badge
