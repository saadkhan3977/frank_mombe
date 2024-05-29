<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Api\BaseController as BaseController;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Post;
use App\Models\PostReply;
use Validator;

class PostController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try{
            
            $video = Post::with('barber_info','reply')->where('user_id',auth()->id())->get();
        
            return response()->json(['success'=>true,'message'=>'Video Lists', 'video_info' => $video],200);
        }
        catch(\Exception $e)
        {
            return response()->json(['success'=>false,'message'=>$e->getMessage()]);
        }
    }
    
    public function video_barber()
    {
        try{
            
            $video = Post::with('user_info','reply')->where('barber_id',auth()->id())->get();
        
            return response()->json(['success'=>true,'message'=>'Video Lists', 'video_info' => $video],200);
        }
        catch(\Exception $e)
        {
            return response()->json(['success'=>false,'message'=>$e->getMessage()]);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
     
    
    public function video_barber_post(Request $request)
    {
        try{
            $validator = Validator::make($request->all(),[
                // 'barber_id' => 'required|exists:users,id', // MP4 format and maximum 2GB size
                'post_id' => 'required|exists:posts,id', // MP4 format and maximum 2GB size
                'video' => 'required|mimes:mp4', // MP4 format and maximum 2GB size
            ]);
            
            if($validator->fails())
            {
                return $this->sendError($validator->errors()->first(),500);
            }

            if ($request->file('video')) {
                $file = $request->file('video');

                $fileName = md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
				$file->move('uploads/videos/', $fileName);
    
                $video = new PostReply();
                $video->user_id = auth()->id(); // Assuming users are authenticated
                $video->post_id = $request->post_id; // Assuming users are authenticated
                //$video->title = $request->file('video')->getClientOriginalName();
                $video->reply = asset('/uploads/videos/'.$fileName);
                $video->save();
    
                return response()->json(['success'=>true,'message'=>'Video uploaded successfully']);
            } 
            else {
                return $this->sendError('Invalid video file.',500);
            }
        }
        catch(\Exception $e)
        {
            return response()->json(['success'=>false,'message'=>$e->getMessage()]);
        }
    }
    
    public function video_reject(Request $request)
    {
        try{
            $validator = Validator::make($request->all(),[
                // 'barber_id' => 'required|exists:users,id', // MP4 format and maximum 2GB size
                'post_id' => 'required|exists:posts,id', // MP4 format and maximum 2GB size
                // 'video' => 'required|mimes:mp4', // MP4 format and maximum 2GB size
            ]);
            
            if($validator->fails())
            {
                return $this->sendError($validator->errors()->first(),500);
            }


            $post =  Post::find($request->post_id);
            $post->delete();

            return response()->json(['success'=>true,'message'=>'Video delete successfully']);
        }
        catch(\Exception $e)
        {
            return response()->json(['success'=>false,'message'=>$e->getMessage()]);
        }
    }
    
    public function store(Request $request)
    {
        try{
            $validator = Validator::make($request->all(),[
                'barber_id' => 'required|exists:users,id', // MP4 format and maximum 2GB size
                'video' => 'required|mimes:mp4', // MP4 format and maximum 2GB size
            ]);
            
            if($validator->fails())
            {
                return $this->sendError($validator->errors()->first(),500);
            }

            if ($request->file('video')) {
                $file = $request->file('video');

                $fileName = md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
				$file->move('uploads/videos/', $fileName);
    
                $video = new Post();
                $video->user_id = auth()->id(); // Assuming users are authenticated
                $video->barber_id = $request->barber_id; // Assuming users are authenticated
                //$video->title = $request->file('video')->getClientOriginalName();
                $video->video = asset('/uploads/videos/'.$fileName);
                $video->save();
    
                return response()->json(['success'=>true,'message'=>'Video uploaded successfully']);
            } 
            else {
                return $this->sendError('Invalid video file.',500);
            }
        }
        catch(\Exception $e)
        {
            return response()->json(['success'=>false,'message'=>$e->getMessage()]);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
