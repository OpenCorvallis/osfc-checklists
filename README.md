# OSFC Checklists

Checklists created by the [Oregon State Flying
Club](https://oregonstateflyingclub.org/) for use by its members.

## How to build

These checklists are written in [Typst](https://typst.app), so you will need the
Typst compiler to build them. If your operating system does not package Typst
(most don't at the moment), you can instead install a Rust toolchain and use
that to install Typst:

```
cargo install typst-cli
```

You also need to create a file called `signature.typ` with your name in it (this
is to distinguish checklists that you print for yourself from the club's
checklists):

```
echo '<your name>' > signature.typ
```

Once you have a working `typst` command, you can build the documents by running:

```
typst compile 66083.typ
typst compile 72pe.typ
typst compile 73146.typ
```
