# Exercise-03d-Shaders

Exercise for MSCH-C220

A demonstration of this exercise is available at [https://youtu.be/Dv6KcsGRbGw](https://youtu.be/Dv6KcsGRbGw)

This exercise will add shaders to our match-3 game. Shaders can require a lot of computing resources, so you will want to use them sparingly. They can make it possible to create unique effects that can lend polish and liveliness to your games.

Fork this repository. When that process has completed, make sure that the top of the repository reads [your username]/Exercise-03d-Shaders. Edit the LICENSE and replace BL-MSCH-C220-S22 with your full name. Commit your changes.

Press the green "Code" button and select "Open in GitHub Desktop". Allow the browser to open (or install) GitHub Desktop. Once GitHub Desktop has loaded, you should see a window labeled "Clone a Repository" asking you for a Local Path on your computer where the project should be copied. Choose a location; make sure the Local Path ends with "Exercise-03d-Shaders" and then press the "Clone" button. GitHub Desktop will now download a copy of the repository to the location you indicated.

Open Godot. In the Project Manager, tap the "Import" button. Tap "Browse" and navigate to the repository folder. Select the project.godot file and tap "Open".

If you run the project, you will see a main menu followed by a simple match-3 game. You will be adding three shaders (and a WorldEnvironment) to the game.

---

Open res://UI/Menu.gd. Create a new Sprite node and make it the first child of Menu. Use res://icon.png as the Texture, turn off Sprite->Offset->Centered and set the scale = (4.5,8). It will look pretty ugly for now, but we will add a Shader to remedy that.

Select the Sprite, and in the Inspector, CanvasItem->Material->Material->New Shader Material. Then edit the new Shader Material. Under ShaderMaterial->Shader = New Shader. Then go to [https://godotshaders.com/shader/clouds-in-motion/](https://godotshaders.com/shader/clouds-in-motion/) and copy the Shader code on that page. Paste it into the Shader Editor Panel.

Back in the ShaderMaterial panel, set Shader Param->Speed = 2. Save the scene and run it. You should now see moving clouds in the background (instead of the Godot icon).

---

Now open res://Game.tscn. Add a new Sprite (rename it Shader) and place it just below the Background. Use res://Assets/background_game.png as the Texture, and turn off Sprite->Offset->Centered. Set Shader->Region->Enabled = On, and set Rect->W = 576 and H = 1024.

In the Inspector, tap the Create New Resource button (top left) and select NoiseTexture. Set NoiseTexture->Seamless = On and Noise->new OpenSimplexNoise. In the Inspector, tap the Save Current Resource button and save it as res://Assets/noise.tres.

Select the Shader node. Set CanvasItem->Material->Material = new Shader Material. Then edit the new Shader Material. Set ShaderMaterial->Shader = New VisualShader. Then edit the new VisualShader. In the Inspector, set VisualShader->Mode = CanvasItem, then drag the Output panel to the right side of the VisualShader editor panel.

It will probably be easiest to set up nodes in three rows. For each node, you can select the Add Node… option or right-click in the working area. The first row should include Textures->Functions->Texture, Color->Variables->ColorConstant, and Vector->Operators->Add.

The second row should include Input->All->UV, Textures->Functions->Texture, Scalar->Operators->Subtract, and Scalar-Functions->Round.

The third row should include Input->All->Time, Scalar->Functions->Cos, Scalar->Operators->Multiply.

In the first row, set the Texture to be res://Assets/background_game.png. In the Color node, set the hex value of the color to #228be6. Connect the magenta output of the Color to the a input of the VectorOp node. Connect the rgb output of the texture to the b input of the VectorOp node. Connect the output of the VectorOp node to the Color input of the Output node.

In the second row, set the Texture to be res://Assets/noise.tres. Connect the output of the Input node to the uv input of the Texture node. Connect the rgb output of the Texture node to the a input of the ScalarOp node. Connect the output of the ScalarOp node ot the input of the ScalarFunc node. Connect the output of the ScalarFunc node to the Alpha input of the Output node.

Finally, in the third row, connect the output of the Input node to the input of the ScalarFunc node. Connect the output of the ScalarFunc node to the a input of the ScalarOp node. For the b input of the ScalarOp node, enter 0.5 (press enter). Connect the output of the ScalarOp node to the b input of the ScalarOp node on the second row.

Close the VisualShader editor and run the game. You should now see an oscillating dissolve effect on the background of the game.

---

Open the res://Pieces/Piece.tscn scene. Create a new Sprite (rename it to Dying) and add it to the bottom of the scene tree. Use res://icon.png as the Texture. Position it at (0,-20)

Create a Shader material for the Dying sprite. Make sure it is Go to [https://godotshaders.com/shader/2d-fire/](https://godotshaders.com/shader/2d-fire/) and copy the shader code. Paste it in the Shader editor panel. 

Back in the Inspector, open the Shader Parameters. Update Spread = 0.6, Noise Tex = new NoiseTexture, Gradient Tex = new GradientTexture. Edit the noise texture, set Seamless = On and Noise = new OpenSimplexNoise. Edit the Gradient Texture, set the Gradient = new Gradient.

Hide the Dying node, and then edit res://Piece/Piece.gd. At the bottom of `func die()`, add this line:
```
		$Dying.show()
```

---

The final step is to add a WorldEnvironment to the Game scene (res://Game.tscn). In the Inspector, set Environment->new Environment, and then edit the Environment.

  * Background->Mode = Canvas
  * Dof Near Blur->Enabled = On
  * Dof Near Blur->Distance = 1.1
  * Glow->Enabled = On
  * Glow->Strength = 0.7
  * Glow->Blend Mode = Additive
  * Glow->Hdr Threshold = 0
  * Glow->Bicubic Upscale = On

---

Test the game and make sure it is working correctly. You should be able to see all the effects we added to the game.

Quit Godot. In GitHub desktop, you should now see the updated files listed in the left panel. In the bottom of that panel, type a Summary message (something like "Completes the exercise") and press the "Commit to master" button. On the right side of the top, black panel, you should see a button labeled "Push origin". Press that now.

If you return to and refresh your GitHub repository page, you should now see your updated files with the time when they were changed.

Now edit the README.md file. When you have finished editing, commit your changes, and then turn in the URL of the main repository page (https://github.com/[username]/Exercise-03d-Shaders) on Canvas.

The final state of the file should be as follows (replacing my information with yours):
```
# Exercise-03d-Shaders

Exercise for MSCH-C220

Adding several shaders and a WorldEnvironment to a simple match-3 game.

## To play

Select and drag tiles using the mouse.


## Implementation

Built using Godot 3.4.2

## References
 * [Juice it or lose it — a talk by Martin Jonasson & Petri Purho](https://www.youtube.com/watch?v=Fy0aCDmgnxg)
 * The match-3 game is derived from code provided by [MisterTaftCreates](https://github.com/mistertaftcreates/Godot_match_3), with an accompanying [YouTube series](https://www.youtube.com/playlist?list=PL4vbr3u7UKWqwQlvwvgNcgDL1p_3hcNn2)
 * [Animal Pack Redux, provided by kenney.nl](https://kenney.nl/assets/animal-pack-redux)
 * [Puzzle Pack 2, provided by kenney.nl](https://kenney.nl/assets/puzzle-pack-2)
 * [Jellee Typeface by Alfredo Marco Pradil](https://fontlibrary.org/en/font/jellee-typeface)
 * [Godot 2D fire shader](https://godotshaders.com/shader/2d-fire/)
 * [Godot Clouds in motion shader](https://godotshaders.com/shader/clouds-in-motion/)
 * [GDQuest Visual Shader Editor in Godot 3.1: Dissolve Shader (tutorial)](https://www.youtube.com/watch?v=sf_Dc4ew3eM)

## Future Development

None

## Created by 

Jason Francis
```
