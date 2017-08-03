using UnityEngine;

[RequireComponent(typeof(PlayerMotor))]
public class PlayerController : MonoBehaviour {

    [SerializeField]
	private float speed = 5f;
	[SerializeField]
	private float lookSensitivity = 3f;

	private PlayerMotor motor;

	void Start()
	{
		motor = GetComponent<PlayerMotor> ();
	}

	void Update ()
	{
		float _Xmov = Input.GetAxisRaw ("Horizontal");
		float _ZMov = Input.GetAxisRaw ("Vertical");

		Vector3 _movHorizontal = transform.right * _Xmov;
		Vector3 _movVertical = transform.forward * _ZMov;

		Vector3 _velocity = (_movHorizontal + _movVertical).normalized * speed;

		motor.Move (_velocity); 

		float _yRot = Input.GetAxisRaw ("Mouse X");

		Vector3 _rotation = new Vector3 (0f, _yRot, 0f) * lookSensitivity;

		motor.Rotate (_rotation);

		float _xRot = Input.GetAxisRaw ("Mouse Y");

		Vector3 _cameraRotation = new Vector3 (_xRot, 0f, 0f) * lookSensitivity;

		motor.RotateCamera (_cameraRotation);
	}
}
