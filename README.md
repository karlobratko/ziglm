# ZiGLM

Zig language implementation of OpenGL Mathematics (GLM) library.

ZiGLM is a Zig language mathematics library for graphics software based on the OpenGL Shading Language (GLSL) specification.

***ZiGLM library is currently under heavy development, so expect changes and frequent updates.***

## 1. Design approach

Every functionallity wich is bound to some structure is implemented with **X** pattern (*I haven't found it anywhere on the Internet so I don't know how to call it - please help if found*). 
Basically, every method is bound to specific mixin which in compile time checks type which is stored in structure and provides only methods for that type. This is implemented by using compile time checks inside mixin methods which on failed check return empty struct, and on match return struct with methods. This structs are then embedded in main mixin using `usingnamespace` keyword. This not only gives us type safety, but totally disables usage of methods which are not intended for that type.

Except for type checking this pattern gives us ability to check for other compile time parameters also, and provide specialised methods for those properties of type, e.g. cross product method, which should be only accessible to 3 dimensional vectors of any numeric type.

This pattern can get a little bit messy, but with quality naming conventions and mixin method ordering we are able to create reusable and manageable code.

## 2. Features

ZiGLM currently provides vector structure implementation. Every available function is named according to GLSL shading language standard. In addition to the standard functions, functions have been added that make creation and comparison of vectors easier.

## 3. Example

```zig
const glm = @import("ziglm");

const Vec3f = glm.Vec3(f32);

const vector = Vec3f.new(4.2, 1.5, 2.8);
const normalized = vector.normalize();
const to_reflect = Vec3f.new(3.2, 2.1, -1.5);
const refl = to_reflect.reflect(normalized);
```

## 4. License
This project is licensed under the **MIT** license - see the [LICENSE.md](/LICENSE) file for details.
