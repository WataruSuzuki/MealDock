import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { OnsenModule } from 'ngx-onsenui';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import {platformBrowserDynamic} from '@angular/platform-browser-dynamic';
import { DishListComponent } from './dish-list/dish-list.component';
import { InFridgeListComponent } from './in-fridge-list/in-fridge-list.component';
import { NotFoundComponent } from './not-found/not-found.component';
import { CartedListComponent } from './carted-list/carted-list.component';

@NgModule({
  declarations: [
      AppComponent,
      DishListComponent,
      InFridgeListComponent,
      NotFoundComponent,
      CartedListComponent
  ],
  imports: [
      BrowserModule,
      AppRoutingModule,
      OnsenModule
  ],
  providers: [],
  schemas: [
      CUSTOM_ELEMENTS_SCHEMA,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
