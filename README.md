# Icomoon::Rails

[IcoMoon](http://icomoon.io/) provides an [application](http://icomoon.io/#app-features) to create your own icon fonts, and also releases an [icon pack for free](http://icomoon.io/#icons).

The `icomoon-rails` gem integrates the free icon pack of `IcoMoon` with the Rails asset pipeline. It also provide a way to fork with your won icon fonts.

It is highly recommanded to create your own fork.

## Usage

### Install icomoon-rails gem

Add this line to your application's Gemfile:

    gem 'icomoon-rails'

And then execute:

    bundle

### Include icomoon-free stylesheet assets

Add to your `app/assets/stylesheets/application.css`

    *= require icomoon-free

### IE7 suppot

If you need to support IE7, there is a `icomoon-free/lte-ie7.js` in javascripts assets.

Use this stylesheet with [conditional comment](http://en.wikipedia.org/wiki/Conditional_comment) may be the best way to support IE7. But it can be difficult when it comes to assets pipeline. See this article on StackOverflow for a workaround: Using Rails 3.1 assets pipeline to conditionally use certain css

## Customization

YOU SHOULD ONLY USE ACTULLY NEEDED ICON FONTS.

You can go to [IcoMoon App](http://icomoon.io/app/) to create your own fonts pack.

1. select the fonts you needed, and click 'Font->' button
2. click 'More Settings' to set your font name and CSS class prefix
3. click 'Save/Load' to save your font pack for futher use
4. click 'Download' to download your font pack as zip file
5. fork this gem from github
6. follow gem maintenace section and replace NAME and ZIP value to create your own fonts assets
7. use `gem 'icomoon-rails', git: 'xxxxxx'` in your Gemfile instead
8. follow other part of usage section

## Gem maintenance

Maintain `icomoon-rails` gem with `Rake` commands.

Download icon fonts from [IcoMoon App](http://icomoon.io/app/).

Update icomoon-free source files.

    rake update-icomoon NAME=icomoon-free ZIP=~/Download/icomoon.zip

Publish gem.

    rake release

## License

The assets from [IcoMoon](http://icomoon.io/) free icon pack use CC License [(CC BY-SA 3.0)](http://creativecommons.org/licenses/by-sa/3.0/).

Other parts of gem use MIT license.
