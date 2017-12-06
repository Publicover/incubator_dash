# DASH INCUBATOR 

This app supports startup incubators as they go through their curricula, typically a 10-week process. The users are admins and students, which must be created before loggin in. Admins can enter assignments as well as class lists via CSV. Students upload homework assignments in nearly any file format directly to the site, and everything is stored on AWS. 

* Each user type has their own dashboard
* Supports password reset emails 
* Supports user avatars 
* Authentication system was written from scratch, without the devise gem
* Ajax calls prevent file upload errors by locking submit buttons before files are attached 
