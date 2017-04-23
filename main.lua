--Main lua file
--First let's display a nice background and some text

local backgroundColor = {72, 142, 240}
local blackColor = {0, 0, 0}
local greyColor = {102, 110, 112}
local dispTextStr = "This sentence has five words. Here are five more words. Five-word sentences are fine. But several together become monotonous. Listen to what is happening. The writing is getting boring. The sound of it drones. It's like a stuck record. The ear demands some variety. Now listen. I vary the sentence length, and I create music. Music. The writing sings. It has a pleasant rhythm, a lilt, a harmony. I use short sentences. And I use sentences of medium length. And sometimes, when I am certain the reader is rested, I will engage him with a sentence of considerable length, a sentence that burns with energy and builds with all the impetus of a crescendo, the roll of the drums, the crash of the cymbals-sounds that say listen to this, it is important."
local dispText --Text object that holds dispTextStr

--Used to keep track of which letters have been typed
local notTypedYet = ""
local alreadyTyped = ""
local coloredText -- use this when we print stuff

function love.load()
	love.graphics.setBackgroundColor(backgroundColor)
	notTypedYet = dispTextStr
  coloredText = {greyColor, alreadyTyped, blackColor, notTypedYet}
	dispText = love.graphics.newText(love.graphics.newFont(20), dispTextStr)
	dispText:setf(coloredText, 700, "left")
end

function love.draw()
	love.graphics.draw(dispText, 50, 200)
end

function love.keypressed( key, scancode, isrepeat )
	if key == 'escape' then
		love.event.push('quit')
  end
end

function love.textinput(text)
  handleText(text)
end

function love.update()

end

function handleText(text)
  print("handle"..text)
	if notTypedYet ~= "" and text == notTypedYet:sub(1, 1) then
    alreadyTyped = alreadyTyped..text
		notTypedYet = notTypedYet:sub(2) --when notTypedYet gives up its final letter, it becomes the sub() function goes out of bounds and returns an empty string.
    coloredText = {greyColor, alreadyTyped, blackColor, notTypedYet}
    dispText:setf(coloredText, 700, "left")
  end
end
