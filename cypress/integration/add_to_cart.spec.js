describe('User navigates to home page', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it("Logs in and adds a product to cart, cart updates to 'My Cart (1)'", () => {
    cy.get('.navbar').contains('Login');
    cy.get('[alt="login"]').click();
    cy.get('[id="email"]').type('bobsmith@gmail.ca')
    cy.get('[id="password"]').type('pass123')
    cy.get('input').contains('Login').click();
    cy.get(".products article").should("be.visible");
    cy.get(".products article").contains("Add").click({force: true});
    cy.get(".nav-link").contains('My Cart (1)')
  });

})