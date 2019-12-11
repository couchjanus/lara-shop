<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
// Route::get('/', 'FrontController@index');
Route::view('/', 'front.pages.index');
Route::get('/category/{slug}', 'Front\CategoryController@show')->name('category.show');
// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/test', function () {
    return view('test.index');
});

use Illuminate\Http\Request;

// Route::post('process', function (Request $request) {
//     $path = $request->file('photo')->store('photos');
//     dd($path);
// });


// Route::post('process', function (Request $request) {
//     // cache the file
//     $file = $request->file('photo');

//     // generate a new filename. getClientOriginalExtension() for the file extension
//     $filename = 'profile-photo-' . time() . '.' . $file->getClientOriginalExtension();

//     // save to storage/app/photos as the new $filename
//     $path = $file->storeAs('photos', $filename);

//     dd($path);
// });

// ================== upload input to accept multiple files. ===================

// <input type="file" name="photos[]" id="photo" multiple>


// Route::post('process', function (Request $request) {
//     $photos = $request->file('photos');
//     $paths  = [];

//     // When we try to process this $request->file('photos'), it's now an array of UploadedFile instances so we need to loop through the array and save each file.

//     foreach ($photos as $photo) {
//         $extension = $photo->getClientOriginalExtension();
//         $filename  = 'profile-photo-' . time() . '.' . $extension;
//         $paths[]   = $photo->storeAs('photos', $filename);
//     }

//     dd($paths);
// });

// ====================validate the uploaded file=========================
Route::post('process', function (Request $request) {
    // validate the uploaded file
    $validation = $request->validate([
        'photo' => 'required|file|image|mimes:jpeg,png,gif,webp|max:2048'
        // for multiple file uploads
        // 'photo.*' => 'required|file|image|mimes:jpeg,png,gif,webp|max:2048'
    ]);
    $file      = $validation['photo']; // get the validated file
    $extension = $file->getClientOriginalExtension();
    $filename  = 'profile-photo-' . time() . '.' . $extension;
    $path      = $file->storeAs('photos', $filename);

    dd($path);
});


require 'admin.php';
Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
