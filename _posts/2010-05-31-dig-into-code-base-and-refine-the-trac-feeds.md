--- 
layout: post 
tags: GSoC 
title: Dig into code base and Refine the trac feeds 
category: tech 
---

The passed week was very busy to me, since the graduation reply. I'm happy that I am about to graduate from the 19 years schooling career, which is really long.  A new start to me, and a new start since then.
    
Following the last week's plan, I went on the refinement of Trac feeds plugin and have made the following tuning:

1.fault tolerance 

The main work went to the fault tolerance, and the UI refinement was rejected at last since it's hard to make a balance between good UI and complex implementation.

And besides that, I started to read the source code of touch screen. Since it's based on Django, I follow the approach of the common Django apps, i.e. urls -> views -> models->templates.

Let's begin the journey. 

## core/urls.py

After digging into the urls.py, it's easy to know each installed plugins will be shown in loalhost/ or localhost/display/, which dispatches the request to display function at core/views.py.

## core/views.py

To simplify the analysis, I will omit some files and logics.

Let's focus on the display function, which render the django dict variables to the corresponding template display.html. The rendered dict includes:

* 'screens':PLUGIN\_MANAGER['ScreenManager'].plugins
*  rc = RequestContext(request, processors=[plugin\_processor, settings\_processor])
* 'screen\_animations':PLUGIN\_MANAGER['ScreenAnimationManager'].plugins

RequestContext will make the plugin\_manager and each plugin's setting available to the template.
and also the screens(plugins) and corresponding animation will be available.

Then let's go to the template.

## core/display.html

In this file, it will load the needed javascript/css to make the infrastructure. 

<script src="https://gist.github.com/3150152.js?file=gistfile1.py"></script>

And the above code snippet will include each screen's specific html into the main html.

## Screen's specific html

Each screen's specific html will decide what content will be put in the screen(plugin) and how it can be shown and also you can write the control commands(key events and etc.) to ease the navigate.

This portion should obey the conversion which is defined by the  touch screen.

## Summary

Till now I only get a big picture of the architecture of touch screen, and some details are still in front me which needs to catch, including:

* other control approaches(twisted and so on)
* the complex class hierarchy 
* the plugin system
* the menu system
* thread syncing mechanism

And after reading some codes, I found some not-so-good codes, e.g. the main html(display.html), in which lots of jquery plugins are included in and most of them are not used in most of the plugins. And also when I try to read the codes of some screen examples, and I found some jquery plugin codes, and I try to figure out which plugin this function belongs to but finally I found it's really difficult to locate the function. IMO, we can refactor the main html and remove the not-necessary  jquery codes and include them in the specific plugin template if the screen html really needs it.

## plan

I will finish my graduation reply this Thursday and will have plenty of time to work on GSoC.

My plan will base on my proposal and also will make some adjustment from mentor's advices.

For the new week, I will:

* read codes
* understand the plugin system
* understand the menu system
* understand the twisted interface
* do some preparation for this ticket http://trac.osuosl.org/trac/touchscreen/ticket/12
