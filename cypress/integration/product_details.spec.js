describe('User navigates to product page', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('Product page loads with correct product details', () => {
    cy.get('.products article').should('be.visible');
    cy.get('[alt="Scented Blade"]').click();
    cy.get('.products-show').should('be.visible');
  });
});