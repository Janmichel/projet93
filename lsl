warning: LF will be replaced by CRLF in src/app/auth/auth-guard.service.ts.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in src/app/auth/auth.service.ts.
The file will have its original line endings in your working directory
warning: LF will be replaced by CRLF in src/app/auth/role-guard.service.ts.
The file will have its original line endings in your working directory
[1mdiff --git a/package-lock.json b/package-lock.json[m
[1mindex b7793cd..f94d765 100644[m
[1m--- a/package-lock.json[m
[1m+++ b/package-lock.json[m
[36m@@ -1020,6 +1020,14 @@[m
         "tslib": "^1.9.0"[m
       }[m
     },[m
[32m+[m[32m    "@auth0/angular-jwt": {[m
[32m+[m[32m      "version": "4.0.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/@auth0/angular-jwt/-/angular-jwt-4.0.0.tgz",[m
[32m+[m[32m      "integrity": "sha512-CHvk1zJ9jpQupl0f5y7EmTvYAwugyFvC4ztLsZKr7ZC7anNVaDd1+pDFJYS+ZEU9jLWzE74+AfVKfigImADJuw==",[m
[32m+[m[32m      "requires": {[m
[32m+[m[32m        "url": "^0.11.0"[m
[32m+[m[32m      }[m
[32m+[m[32m    },[m
     "@babel/code-frame": {[m
       "version": "7.8.3",[m
       "resolved": "https://registry.npmjs.org/@babel/code-frame/-/code-frame-7.8.3.tgz",[m
[36m@@ -5450,6 +5458,11 @@[m
         "set-immediate-shim": "~1.0.1"[m
       }[m
     },[m
[32m+[m[32m    "jwt-decode": {[m
[32m+[m[32m      "version": "2.2.0",[m
[32m+[m[32m      "resolved": "https://registry.npmjs.org/jwt-decode/-/jwt-decode-2.2.0.tgz",[m
[32m+[m[32m      "integrity": "sha1-fYa9VmefWM5qhHBKZX3TkruoGnk="[m
[32m+[m[32m    },[m
     "karma": {[m
       "version": "4.1.0",[m
       "resolved": "https://registry.npmjs.org/karma/-/karma-4.1.0.tgz",[m
[36m@@ -8060,8 +8073,7 @@[m
     "querystring": {[m
       "version": "0.2.0",[m
       "resolved": "https://registry.npmjs.org/querystring/-/querystring-0.2.0.tgz",[m
[31m-      "integrity": "sha1-sgmEkgO7Jd+CDadW50cAWHhSFiA=",[m
[31m-      "dev": true[m
[32m+[m[32m      "integrity": "sha1-sgmEkgO7Jd+CDadW50cAWHhSFiA="[m
     },[m
     "querystring-es3": {[m
       "version": "0.2.1",[m
[36m@@ -10092,7 +10104,6 @@[m
       "version": "0.11.0",[m
       "resolved": "https://registry.npmjs.org/url/-/url-0.11.0.tgz",[m
       "integrity": "sha1-ODjpfPxgUh63PFJajlW/3Z4uKPE=",[m
[31m-      "dev": true,[m
       "requires": {[m
         "punycode": "1.3.2",[m
         "querystring": "0.2.0"[m
[36m@@ -10101,8 +10112,7 @@[m
         "punycode": {[m
           "version": "1.3.2",[m
           "resolved": "https://registry.npmjs.org/punycode/-/punycode-1.3.2.tgz",[m
[31m-          "integrity": "sha1-llOgNvt8HuQjQvIyXM7v6jkmxI0=",[m
[31m-          "dev": true[m
[32m+[m[32m          "integrity": "sha1-llOgNvt8HuQjQvIyXM7v6jkmxI0="[m
         }[m
       }[m
     },[m
[1mdiff --git a/package.json b/package.json[m
[1mindex 24e60ab..2d6aeb0 100644[m
[1m--- a/package.json[m
[1m+++ b/package.json[m
[36m@@ -19,6 +19,8 @@[m
     "@angular/platform-browser": "~8.1.0",[m
     "@angular/platform-browser-dynamic": "~8.1.0",[m
     "@angular/router": "~8.1.0",[m
[32m+[m[32m    "@auth0/angular-jwt": "^4.0.0",[m
[32m+[m[32m    "jwt-decode": "^2.2.0",[m
     "rxjs": "~6.4.0",[m
     "tslib": "^1.9.0",[m
     "zone.js": "~0.9.1"[m
[1mdiff --git a/src/app/app-routing.module.ts b/src/app/app-routing.module.ts[m
[1mindex 06c7342..1edc225 100644[m
[1m--- a/src/app/app-routing.module.ts[m
[1m+++ b/src/app/app-routing.module.ts[m
[36m@@ -1,11 +1,16 @@[m
[31m-import { NgModule } from '@angular/core';[m
[31m-import { Routes, RouterModule } from '@angular/router';[m
[32m+[m[32mimport {NgModule} from '@angular/core';[m
[32m+[m[32mimport {Routes, RouterModule} from '@angular/router';[m
[32m+[m[32mimport {AppComponent} from './app.component';[m
 [m
 [m
[31m-const routes: Routes = [];[m
[32m+[m[32mconst routes: Routes = [{[m
[32m+[m[32m  path: 'profile',[m
[32m+[m[32m  component: AppComponent,[m
[32m+[m[32m}];[m
 [m
 @NgModule({[m
   imports: [RouterModule.forRoot(routes)],[m
   exports: [RouterModule][m
 })[m
[31m-export class AppRoutingModule { }[m
[32m+[m[32mexport class AppRoutingModule {[m
[32m+[m[32m}[m
[1mdiff --git a/src/app/auth/auth-guard.service.ts b/src/app/auth/auth-guard.service.ts[m
[1mindex dedfd31..9e2d64b 100644[m
[1m--- a/src/app/auth/auth-guard.service.ts[m
[1m+++ b/src/app/auth/auth-guard.service.ts[m
[36m@@ -1,9 +1,17 @@[m
[31m-import { Injectable } from '@angular/core';[m
[32m+[m[32mimport {Injectable} from '@angular/core';[m
[32m+[m[32mimport {Router, CanActivate} from '@angular/router';[m
[32m+[m[32mimport {AuthService} from './auth.service';[m
 [m
[31m-@Injectable({[m
[31m-  providedIn: 'root'[m
[31m-})[m
[31m-export class AuthGuardService {[m
[32m+[m[32m@Injectable()[m
[32m+[m[32mexport class AuthGuardService implements CanActivate {[m
[32m+[m[32m  constructor(public auth: AuthService, public router: Router) {[m
[32m+[m[32m  }[m
 [m
[31m-  constructor() { }[m
[32m+[m[32m  canActivate(): boolean {[m
[32m+[m[32m    if (!this.auth.isAuthenticated()) {[m
[32m+[m[32m      this.router.navigate(['login']);[m
[32m+[m[32m      return false;[m
[32m+[m[32m    }[m
[32m+[m[32m    return true;[m
[32m+[m[32m  }[m
 }[m
[1mdiff --git a/src/app/auth/auth.service.ts b/src/app/auth/auth.service.ts[m
[1mindex af27fde..cd241f7 100644[m
[1m--- a/src/app/auth/auth.service.ts[m
[1m+++ b/src/app/auth/auth.service.ts[m
[36m@@ -1,9 +1,16 @@[m
[31m-import { Injectable } from '@angular/core';[m
[32m+[m[32mimport {Injectable} from '@angular/core';[m
[32m+[m[32mimport {JwtHelperService} from '@auth0/angular-jwt';[m
 [m
[31m-@Injectable({[m
[31m-  providedIn: 'root'[m
[31m-})[m
[32m+[m[32m@Injectable()[m
 export class AuthService {[m
[32m+[m[32m  constructor(public jwtHelper: JwtHelperService) {[m
[32m+[m[32m  }[m
 [m
[31m-  constructor() { }[m
[32m+[m[32m  // ...[m
[32m+[m[32m  public isAuthenticated(): boolean {[m
[32m+[m[32m    const token = localStorage.getItem('token');[m
[32m+[m[32m    // Check whether the token is expired and return[m
[32m+[m[32m    // true or false[m
[32m+[m[32m    return !this.jwtHelper.isTokenExpired(token);[m
[32m+[m[32m  }[m
 }[m
[1mdiff --git a/src/app/auth/role-guard.service.ts b/src/app/auth/role-guard.service.ts[m
[1mindex 5c99f2f..6ae3368 100644[m
[1m--- a/src/app/auth/role-guard.service.ts[m
[1m+++ b/src/app/auth/role-guard.service.ts[m
[36m@@ -1,9 +1,31 @@[m
[31m-import { Injectable } from '@angular/core';[m
[32m+[m[32mimport {Injectable} from '@angular/core';[m
[32m+[m[32mimport {[m
[32m+[m[32m  Router,[m
[32m+[m[32m  CanActivate,[m
[32m+[m[32m  ActivatedRouteSnapshot[m
[32m+[m[32m} from '@angular/router';[m
[32m+[m[32mimport {AuthService} from './auth.service';[m
[32m+[m[32mimport decode from 'jwt-decode';[m
 [m
[31m-@Injectable({[m
[31m-  providedIn: 'root'[m
[31m-})[m
[31m-export class RoleGuardService {[m
[32m+[m[32m@Injectable()[m
[32m+[m[32mexport class RoleGuardService implements CanActivate {[m
[32m+[m[32m  constructor(public auth: AuthService, public router: Router) {[m
[32m+[m[32m  }[m
 [m
[31m-  constructor() { }[m
[32m+[m[32m  canActivate(route: ActivatedRouteSnapshot): boolean {[m
[32m+[m[32m    // this will be passed from the route config[m
[32m+[m[32m    // on the data property[m
[32m+[m[32m    const expectedRole = route.data.expectedRole;[m
[32m+[m[32m    const token = localStorage.getItem('token');[m
[32m+[m[32m    // decode the token to get its payload[m
[32m+[m[32m    const tokenPayload = decode(token);[m
[32m+[m[32m    if ([m
[32m+[m[32m      !this.auth.isAuthenticated() ||[m
[32m+[m[32m      tokenPayload.role !== expectedRole[m
[32m+[m[32m    ) {[m
[32m+[m[32m      this.router.navigate(['login']);[m
[32m+[m[32m      return false;[m
[32m+[m[32m    }[m
[32m+[m[32m    return true;[m
[32m+[m[32m  }[m
 }[m
