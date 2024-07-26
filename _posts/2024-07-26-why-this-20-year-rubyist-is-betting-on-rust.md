---
title: Why this 20-year Rubyist is betting on Rust
layout: post
---

A redditor asks for a [Modern Cloud Tech Stack that is not Ruby](https://www.reddit.com/r/ruby/comments/1ecppm7/comment/lf28gt5/?context=3).

They emphasize a few features influencing their decision:

* B2B web solution with a big API and multiple UIs.
* Tens of millions of objects processed monthly, with hundreds of millions of requests.
* Cloud, probably k8s, maybe serverless.
* A Rails influenced preference for monoliths over microservices.
* Easy horizontal scaling.
* Mature enough to support this app for 10+ years.

For starters, I have also been a Rails dev for 20+ years. But I've come to a point where any new project I start these days that is not an obvious fit for Ruby on Rails is going to be built in Rust.

For a question like this, I suggest looking at Rust with Axum on the backend, along with whatever popular React/Nextjs framework in front. There are some attempts at a Rails-style ORM aesthetics in Rust, but I find dropping down to raw SQL with sqlx to be plenty ergonomic. In Rust, less is more. If you've ever done work with Sinatra, think of that aesthetic.

For APIs — the Rust serde ecosystem lends itself to JSON APIs very nicely. Describe the shape of the incoming params or body, with static type checking everywhere. Also there are some useful crates for describing OpenAPI specs alongside the routing.

Tens of millions of objects monthly could be a thousand per minute, or maybe tens per second, which is not inherently crazy. Computers are fast. If there is anything _complex_ about processing these objects, it will benefit from Rust's approach to fearless concurrency. Mostly this, ahem, task goes to Tokio for IO based async, with Rayon stepping in for scheduling CPU intensive work. And with solid concurrency primitives sorted, you're doing the same capacity-architecting work for compute vs. IO that you'd do in any other language. Rust memory management means no more heuristics for guesstimating GC overhead.

Cloud deployment, k8s, serverless -- yes, sure. I have been particularly liking the devops story for Rust when it lets me ship statically linked binaries that have essentially zero runtime dependencies. Rust will particularly benefit in serverless with very fast cold start times. Beyond that, let's just say I have... many other thoughts about devops. Stay tuned.

Majestic monolith? Go for it. Rust will offer some really nice development conventions here to coordinate how different people and teams approach the work. Static types and ownership make for really nice internal API conventions. Of course you also get standardized code formatting and linting with rustfmt and rust-analyzer. Good documentation is baked in to the tooling. Everything that microservices solve at a development-cultural-integration level is right there at one's fingertips in the IDE. And you can still split out microservices later, too, if needed.

Easy horizontal scaling is about scheduling sensible bits of work and coordinating where that work happens. You'll still have a load balancer in front of multiple app servers for proper cloud availability, no need to invent any wheels here. Tokio tasks will do a lot of heavy lifting once you get to a service. Beyond that you have the same classical scaling constraints when you talk data and persistence, which is going to be a database concern. You use managed services, right?

As to that 10-year lifetime, I have a couple Ruby and Java apps that I've maintained for that long. The thing they have in common is that they've been rewritten anywhere from two to five times, even when they aren't being rewritten in a new language. Languages and libraries and labor markets evolve over those kinds of time frames at fairly fundamental levels, to say nothing of the evolution of the problem to be solved, and our understanding of it. Good test suites help. Well contained and reproducible builds help a lot, too, and are often overlooked. I feel like Rust's approach to managing crates, language editions, and conventions for minimum supported rust version (MSRV) should help a lot here, certainly it's a major language which has had an opportunity to learn from others that have come before.

There's a lot to love about Rust itself as a language. It's ranking well the last few years on Stack Overflow as the most beloved language. It doesn't have null, so there is no 'undefined method `:foo' for nil:NilClass' … ever. Instead you get Option. And instead of raising exceptions, you can return a Result, which the compiler will very helpfully remind or require you to check when one is returned to your code.

But the thing I love most about working with Rust is it's the first language I've learned in 20+ years that has made me a better programmer. I have better instincts with modeling my objects, organizing my code, handling errors, and building for concurrency, all of which translate nicely back to the work I do in Rails. Or so I think. Ask my teammates.

And speaking of teammates, yes, Rust is a bit more niche of a community right now. It comes with a reputation for a harder learning curve, and yes, that's real. But the productivity payoff from that learning curve is also real. I think we'll continue to see Rust take over large chunks of different industries, and its web API capabilities are already quite good.

Even setting aside the rate of developer adoption, my own bet on Rust is a bet on my ability to hire and train any developer from any particular background, and train them up to the standards I need. My own learning curve was tough, but once it all clicked for me, teaching one of my teammates went a lot more quickly. If someone is hiring up a team rapidly, it may make sense to draw from a larger pool and outsource more of that learning curve. But for a team that can afford to hire slowly and deliberately, the ability to train any capable developer with good results outweighs access to a pool of interchangeable skillsets, in my opinion.

So what tech stack am I choosing for the next 10 years?

Well, for Rails-shaped problems: Rails! Perhaps someone will create a killer framework that replaces it, but I am not holding my breath and waiting while Rails is right there. If you want to put forms in front of fairly shallow domain models, just grab Rails and ship it.

For just about everything else, I'm choosing Rust. All of my bash scripts, and a few Crystal: rewritten in Rust. That CLI doesn't give me the behavior I want? A crate with sensible C bindings is probably available, I'll write my own. Backend APIs, high performance proxies, multitenant app servers, server side agents, batch data processing, this blog, machine learning... Rust, Rust, Rust, Rust, Rust, Jekyll, Rust.





