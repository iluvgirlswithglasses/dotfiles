
# What is this?

This guide explains how to customize firefox's private window greeting screen. The result should be the browser you saw in the showcase.

# Step 1: Modify Firefox config

Search 'about:config' on firefox's search bar and set the following properties:

```
toolkit.legacyUserProfileCustomizations.stylesheets true
layout.css.moz-document.content.enabled             true
```

# Step 2: Copy `chrome` directory to your Firefox profile

Firstly, navigate your firefox's profile directory. Mine look like this:

```
~/.mozilla/firefox/ofqvdr63.default-esr
```

Then, copy `./user-chrome/chrome` to the profile directory like this:

```sh
cp -r ./user-chrome/chrome ~/.mozilla/firefox/ofqvdr63.default-esr
```

