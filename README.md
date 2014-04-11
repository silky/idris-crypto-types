idris-crypto-types
==================

This is an exploratory _research_ project to investigate how dependent types can be used to model cryptographic thingies through `Idris`.

These cryptographic thingies will be modern cryptography (std), and modern modern (adv) crypto.
These are my own terms to refer to cryptographic primitives and ideas that were realised before and after the year 2000.

A rough idea of what I claim is modern and modern modern include:

* Standard Crypto
  * Public Key Encryption :: RSA, ElGamal, ECC
  * Digital Signatures :: DSA, ECDSA
  * Block Ciphers :: Blowfish, Skipjack, 3DES, DES, AES
* Advanced Crypto
  * IBE
  * ABE (CP and KP)
  * PBE (AH and normal)
  * FE


This project is dual licensed under BSD (3-clause) and CRAPL to reflect both its academic nature and proper licensing.

I may or may not accept contributions to the project.
If you are a fellow academic and crypto-nerd (crypto-nut) I would very much like to hear from you and work with you on this.
Papers, Papers, Papers...

## Related projects

Also note there is another project [`idris-crypto`](https://github.com/idris-hackers/idris-crypto/) that looks at building primitives in crypto.
A binding to libSodium [has been developed as well](https://github.com/edwinb/idris-sodium/).

## Idris

Idris is a general purpose functional language [Idris](http://www.idris-lang.org) with features influenced by Haskell and ML, including:

* Full dependent types with dependent pattern matching
* where clauses, with rule, simple case expressions, pattern matching let and lambda bindings
* Dependent records with projection and update
* Type classes
* Monad comprehensions
* Syntactic conveniences for lists, tuples, dependent pairs
* do notation and idiom brackets
* significant syntax
* Extensible syntax
* Tactic based theorem proving (influenced by Coq)
* Cumulative universes
* Totality checking
* Simple foreign function interface (to C)
* Hugs style interactive environment

It is important to note that the `Idris` language is first and foremost a research project, and thus the tooling provided by `idris-crypto-types` should not necessarily be seen as production ready nor for industrial use.

## Note on Security

The security of cryptographic software libraries and implementations is a tricky thing to get right.
The notion of what makes a cryptographic software library secure can be a highly contested subject.
It is not _good enough_ that a crypto software library is _just_ functionally correct, and contains no coding errors.
A secure cryptographic software library needs to be resitant to many types of attack for instance:

* Software bugs
* Lack of adherence to a specification
* Use of a poor specification
* Use of poor primitives
* Side Channel Attacks
* Using unproven math
* Use of provably secure crypto
* the list goes on and on and on.

A language that is safer than `C` only gets you so far.
However, the use of a __general purpose language__ that supports:

* full dependent types,
* totality checking,
* tactic based theorem proving,
* code generation to other languages

arguably provides an really interesting development environment in which to explore the development of possibly _provably secure_ and _demonstrably correct_ cryptographic primitives.
