
# What is this?

This guide explains how to customize firefox's private window greeting screen, as well as how to add local extensions. The result should look like this:

![Firefox extensions](../showcase/4.png)

# Firefox config

Search 'about:config' on firefox's search bar and set the following properties:

```
toolkit.legacyUserProfileCustomizations.stylesheets true
layout.css.moz-document.content.enabled             true
extensions.langpacks.signatures.required            false
xpinstall.signatures.required                       false
```

# Customizing private window greeting screen

Firstly, navigate your firefox's profile directory. Mine look like this:

```
/home/mika/.mozilla/firefox/ofqvdr63.default-esr
```

Then, depending on your preferences, copy either `./user-chrome/chrome` or `./user-chrome-for-sakura-theme/chrome` to the firefox's profile directory. The first option keeps the default firefox background color, while the second option offers a background as dark as you see in my showcases.

# Adding the new tab extension

Search 'about:addons' on firefox's search bar. From the drop-down menu next to the "Manage Your Extensions" title, click "Install Add-on From File."

Then, you may install `./sakura-theme.zip` to get my firefox theme. Furthermore, you can install `./blank-page-for-sakura-theme.zip` for my homepage and newtab style (the one with a single clock).

