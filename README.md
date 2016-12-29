# farkle

David Laing, December 2016

## farkle.R

I wrote this script to figure out a good strategy for the game [Farkle](https://en.wikipedia.org/wiki/Farkle). The strategy I came up with is blunt and simple:

1. If you can roll five or six dice, *always* do so.
2. If you can roll four dice, do so unless it means risking 1700 points or more.
3. If you can roll three dice, do so unless it means risking 450 points or more.
4. If you can only roll one or two dice, *never* do so unless you're not on the board yet and you still have less than 500 points in your current turn.

At the heart of the strategy is the following insight: you should only roll the dice if the expected utility of the *gain* from rolling is equal to or greater than your current score. In other words, if your score is already high and you don't stand to gain much, then you might as well stop now rather than risking the points you've already racked up.

One limitation of my `stop_or_not` function is that it doesn't take into account the additional expected utility of resetting to six dice. For example, if you have only one die left, `stop_or_not` asks whether the expected utility of that single roll can offset the risk of losing all your current points, and it doesn't take into account the additional points you might win if you successfully make it to the reset to six dice. In this sense, the script is a bit conservative. This means that it might be reasonable to keep rolling until you have a bit more than the scores listed above. Whether or not you do this might depend on how close you are to 10,000 points, or how closely you're tied with another player.