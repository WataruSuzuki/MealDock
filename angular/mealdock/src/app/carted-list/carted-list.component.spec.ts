import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CartedListComponent } from './carted-list.component';

describe('CartedListComponent', () => {
  let component: CartedListComponent;
  let fixture: ComponentFixture<CartedListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CartedListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CartedListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
