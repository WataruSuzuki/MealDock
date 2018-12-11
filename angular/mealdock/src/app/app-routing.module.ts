import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DishListComponent } from './dish-list/dish-list.component';
import { InFridgeListComponent } from './in-fridge-list/in-fridge-list.component';
import { CartedListComponent } from './carted-list/carted-list.component';
import { NotFoundComponent } from './not-found/not-found.component';

const routes: Routes = [
    { path: '', component: DishListComponent },
    { path: 'dishes', component: DishListComponent },
    { path: 'infridgeFoods', component: InFridgeListComponent },
    { path: 'cartedFoods', component: CartedListComponent },
    { path: '**', component: NotFoundComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
