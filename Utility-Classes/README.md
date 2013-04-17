# Utility Classes

### A list of objective-c utility classes to help you in your iOS endevours

+ _BCVideo+SDKDictionaryHelper_ - a category that helps you get information from the BCVideo property Dictionary
+ _BCSDKCatalog_ - a subclass of the BCCatalog that helps you get additional fields from video cloud.  Dependency on BCSDKMediaService
+ _BCSDKMediaService_ - a subclass of BCMediaService that helps you get additional fields from video cloud. This subclass overrides makeVideoFromJSON to give you the ability to add additional fields to the BCVideo object returned.  As an example, there is code in BCSDKMediaService to show how to detect if long description is returned and add it to the BCVideo properties dictionary.  Additional logic is required for other video fields

### BCSDKCatalog Example

````objective-c
self.catalog = [[BCSDKCatalog alloc] initWithToken:@"nFCuXstvl910WWpPnCeFlDTNrpXA5mXOO9GPkuTCoLKRyYpPF1ikig.."];

//Required video fields - do not change these.
NSString *requiredVideoFields = @"FLVFullLength,videoStillURL,name,shortDescription,referenceId,id,customFields,FLVURL";

//Additional fields can be added
NSString *additionalFields = @"longDescription,tags";

//Creating video fields string for options
NSString *video_fields = [requiredVideoFields stringByAppendingFormat:@",%@", additionalFields];

//Options
NSDictionary *options = @{@"video_fields" : video_fields};

/*
 * Find a playlist by ID, this ID can be found in the video cloud interface, or you could use a reference ID
 */
[self.catalog findPlaylistByID:@"2149006311001" options:options callBlock:^(BCError *error, BCPlaylist *bcPlaylist) {
    //Your code goes here!
}];
````
