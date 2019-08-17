---
title: "Flexbox or Bust in 2014"
date:   2013-12-23 12:59:00
layout: post
excerpt: "Leveling up our UI toolkit in the early-ish days of responsive design."
---

About a week ago, I had a brief exchange with my business partner, Kyle:

> **Kyle:** Btw, I think we should flexbox or bust on our CSS.
> **Nick:** I could be convinced.

The [CSS Flexible Box Layout Module](http://www.w3.org/TR/css3-flexbox/) (<q>CSS flexbox,</q> or just, <q>flexbox</q>) is a candidate recommendation for inclusion in CSS3. It's a box model that's <q>optimized for user interface design.</q> That's a rather *noble* goal for CSS. Frankly, one which feels years overdue.

To date, layout with CSS has been an exercise in the arcane. The aspiring user interface designer needs to care about pixels and percents, margins, padding, and the differences and subtle interactions of positioning and floating. For even the technically-minded, these details can be interesting in the abstract, but as a day to day concern, it's hard to really care that much about them.

Enter CSS frameworks. A codification of pixels and positioning into rules and convenetions. <q>Just rub some classes on it,</q> and you've got yourself a grid. Most of the time, that is, if you squint just right, and avoid straying too far off the beaten path.

The problem with frameworks, in my experience, is that they're a great way to get started, but a poor tool for long-term maintenance. Most frameworks bill themselves as a good way to get started. But by the time you start hitting edge cases that don't quite do what you want, you're in too deep. Your markup has framework-specific classes all through it, and you end up causing little visual regressions all over the place whenever you make a tweak.

The promise of CSS flexbox is the removal of one major source of maintenance headache in UI design for the web: layout, and grids. By providing more powerful abstractions for how elements are laid out on the page, flexbox distills a lot of power into a very small handful of pithy CSS directives.

What this means for us—why we're going <q>flexbox or bust</q>—is that we can spend less time debating frameworks or fiddling with arcane CSS implementation details, and more time building new features.

This layout here is my own experiment in CSS flexbox layout. In about 15 lines of CSS, I have a nice responsive layout, using purely semantic markup.

Flexbox or bust. It's the future.


<!-- Notes to self for editing:

- Expand on value of semantic-only markup for maintenance and agility
- Tone is too acerbic?
- Too much jargon? Who's the audience? -->
