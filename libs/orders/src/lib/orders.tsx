import styled from '@emotion/styled';

/* eslint-disable-next-line */
export interface OrdersProps {}

const StyledOrders = styled.div`
  color: pink;
`;

export function Orders(props: OrdersProps) {
  return (
    <StyledOrders>
      <h1>Welcome to Orders! You Asshole</h1>
    </StyledOrders>
  );
}

export default Orders;
