import { connect } from 'react-redux';
import { logIn } from '../../actions/session';
import Login from './login';

const mapDispatchToProps = dispatch => ({
    logIn: formUser => dispatch(logIn(formUser)),
});

export default connect(null, mapDispatchToProps)(Login);
