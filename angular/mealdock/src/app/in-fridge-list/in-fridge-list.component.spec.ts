import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InFridgeListComponent } from './in-fridge-list.component';

describe('InFridgeListComponent', () => {
  let component: InFridgeListComponent;
  let fixture: ComponentFixture<InFridgeListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InFridgeListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InFridgeListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
