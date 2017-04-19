/*:
 
 # Canvas
 
 The Canvas class provides methods that allow basic shapes to be drawn on a Cartesian plane.
 
 - callout(Experiment):
 
    Uncomment line 27 so that the axes of the plane are automatically drawn.
 
    Where is the origin?
 
    In what direction do values on the *x* and *y* axes increase?
 
 */
// These are some required statements to make this playground work.
import Cocoa
import PlaygroundSupport

// Create a new canvas
let canvas = Canvas(width: 500, height: 500)

// View the current state of the canvas
canvas

// Draw the axes
canvas.drawAxes()
canvas.translate(byX: 0, byY: 300)

// Add code below...
let axiom = "F++F++F"
let rule = "F-F++F-F"
let angle = 60
let length = 100

func createWord(axiom: String, rule: String) -> String
{
    var newWord = ""
    
    for character in axiom.characters
    {
        (character == "F") ? (newWord += rule) : (newWord += String(character))
    }
    
    return newWord
}

func drawWord(word: String)
{
    for character in word.characters
    {
        switch character {
        case "F":
            canvas.drawLine(fromX: 0, fromY: 0, toX: length, toY: 0)
            canvas.translate(byX: length, byY: 0)
            break
        case "+":
            canvas.rotate(by: (Degrees)(360 - angle))
            break
        case "-":
            canvas.rotate(by: Degrees(angle))
            break
        default:
            break
        }
    }
}

print(createWord(axiom: axiom, rule: rule)) // New word
drawWord(word: createWord(axiom: axiom, rule: rule))


/*:
 
 ## To see output
 
 To see output, ensure that you have enabled the Assistant Editor...
 
 ![assistant-editor](assistant-editor.png "Enable the Assistant Editor")
 
 ... and verify that you have selected the *Timeline* option:
 
 ![timeline-option](timeline-option.png "Show the timeline")
 
 Finally, do not remove the following line of code:

 */
PlaygroundPage.current.liveView = canvas.imageView
