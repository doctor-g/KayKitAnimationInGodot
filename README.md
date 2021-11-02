# Demonstrating a KayKit Animated Character in Godot Engine 3.x

## Background

I heard about [Kay Lousberg's "KayKit" assets](https://kaylousberg.itch.io/) recently and wanted to 
try bringing them into Godot Engine.
I ran into some stumbling blocks but I finally got it working, so this repository contains my
proof-of-concept integration.

## Assets Used

- [KayKit Character Animations](https://kaylousberg.itch.io/kaykit-animations)
- [KayKit Dungeon Pack](https://kaylousberg.itch.io/kaykit-dungeon)

## Process

As [mentioned on the animation pack page](https://itch.io/t/1355798/issue-with-godot), the animations
do not import correctly with the "improved" FBX importer of Godot 3.3. To get around this,
use Godot 3.2 to do the importation. Then, you should be able to open the project with Godot 3.3
with no trouble.

Here are the steps:

1. Import the KayKit Animated Character fbx file from the animations pack. I have put it in the "Animations" folder.

1. Make a new inherited scene from it. For example, double-clicking the fbx file prompts you to open an inherited scene.
  I have named mine `CustomCharacter.tscn`.

1. Add new bone attachments as described in the KayKit Animation documentation, with the caveat that you don't need
  one for the body. That is, make five `BoneAttachment` nodes and attach these to the five non-body bones
  of the model (head, armLeft, etc.).

1. Import the character you want to animate. I've used the gltf version of the Knight from the Dungeon Pack, and I've
  put it into the folder called "Knight".

1. Make a new scene for your character. I've called mine `Knight.tscn` and made it a Spatial. 

1. Instance the `CustomCharacter` and the new character (e.g. knight) into this new Scene.
   Right-click on both of them and make them local.

1. Reparent the mesh nodes of the new character onto the bone attachment nodes of `CustomCharacter` 
   as described in the Animation Pack documentation _except_ don't do this for the body.
   Instead, make the body mesh at the top level, where PrototypePete is. 

1. Delete PrototypePete. Bye Pete!

That should do it! Running `Level.tscn` shows the knight playing its cheer animation. 